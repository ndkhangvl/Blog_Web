const knex = require('../databases/knex');
class BlogService {
    constructor() {
        this.posts = knex('posts');
        this.users = knex('users');
        this.likes = knex('likes');
    }

    //Define methods for accessing the database //USER
    #getUser(payload) {
        const user = { ...payload };
        const userProperties = [
            "user_name", "user_usname", "user_passwd"
        ];
        //Remove non-user properties
        Object.keys(user).forEach(function (key) {
            if (userProperties.indexOf(key) == -1) {
                delete user[key];
            }
        });
        return user;
    }
    async signUp(payload) {
        const user = this.#getUser(payload);
        const [user_id] = await this.users.insert(user);
        return { user_id, ...user };
    }

    async allUser() {
        return await this.users.select('user_id', 'user_name', 'user_usname');
    }
    async findByUsername(keyword) {
        return await this.users
            .where('user_name', 'like', `%${keyword}%`)
            .orWhere('user_usname', 'like', `%${keyword}%`)
            .select('user_id', 'user_name', 'user_usname');
    }

    async findByUserId(username) {
        return await this.users.where('user_usname', username).select('user_id', 'user_name', 'user_usname').first();
    }

    #getInfoUser(payload) {
        const user = { ...payload };
        const userProperties = [
            "user_name"
        ];
        //Remove non-user properties
        Object.keys(user).forEach(function (key) {
            if (userProperties.indexOf(key) == -1) {
                delete user[key];
            }
        });
        return user;
    }
    async updateUser(username, payload) {
        const update = this.#getInfoUser(payload);
        return await this.users.where('user_usname', username).update(update);
    }

    #getPassUser(payload) {
        const user = { ...payload };
        const userProperties = [
            "user_passwd"
        ];
        //Remove non-user properties
        Object.keys(user).forEach(function (key) {
            if (userProperties.indexOf(key) == -1) {
                delete user[key];
            }
        });
        return user;
    }
    async updatePassUser(username, payload) {
        const update = this.#getPassUser(payload);
        return await this.users.where('user_usname', username).update(update);
    }

    //Define methods for accessing the database //POST
    #getPost(payload) {
        const post = { ...payload };
        const postProperties = [
            "user_id", "post_title", "post_content"
        ];
        //Remove non-user properties
        Object.keys(post).forEach(function (key) {
            if (postProperties.indexOf(key) == -1) {
                delete post[key];
            }
        });
        return post;
    }
    async createPost(payload) {
        const post = this.#getPost(payload);
        const [post_id] = await this.posts.insert(post);
        return { post_id, ...post };
    }

    async allPost() {
        return await this.posts
            .select('posts.post_id', 'user_name', 'user_usname', 'post_dateUp', 'post_title', 'post_content')
            .join('users', 'users.user_id', 'posts.user_id')
            .leftJoin('likes', 'posts.post_id', 'likes.post_id')
            .count('likes.post_id', { as: 'numLike' }).groupBy('likes.post_id')
            .orderBy('post_dateUp', "desc");
    }
    async findByTitle(keyword) {
        return await this.posts
            .select('posts.post_id', 'user_name', 'user_usname', 'post_dateUp', 'post_title', 'post_content')
            .join('users', 'users.user_id', 'posts.user_id')
            .leftJoin('likes', 'posts.post_id', 'likes.post_id')
            .count('likes.post_id', { as: 'numLike' }).groupBy('likes.post_id')
            .where('post_title', 'like', `%${keyword}%`)
            .orderBy('post_dateUp', "desc");
    }

    async findByPostId(id) {
        return await this.posts
            .select('posts.post_id', 'user_name', 'user_usname', 'post_dateUp', 'post_title', 'post_content').first()
            .join('users', 'users.user_id', 'posts.user_id')
            .leftJoin('likes', 'posts.post_id', 'likes.post_id')
            .count('likes.post_id', { as: 'numLike' }).groupBy('likes.post_id')
            .where('posts.post_id', id);
    }

    #getContentPost(payload) {
        const post = { ...payload };
        const postProperties = [
            "post_title", "post_content"
        ];
        //Remove non-user properties
        Object.keys(post).forEach(function (key) {
            if (postProperties.indexOf(key) == -1) {
                delete post[key];
            }
        });
        return post;
    }
    async update(id, payload) {
        const update = this.#getContentPost(payload);
        return await this.posts.where('post_id', id).update(update);
    }

    async delete(id) {
        await this.likes.where('post_id', id).del();
        return await this.posts.where('post_id', id).del();
    }

    //like
    async isLike(postid, userid) {
        const [post_id] = await this.likes.select('*').where('user_id', userid).andWhere('post_id', postid);
        if (post_id) {
            return 1;
        }else
        return;
    }

    async updateLike(postid, userid) {
        const insertData = {
            user_id: userid,
            post_id: postid
          }
        return await this.likes.insert(insertData);
    }
    async updateDislike(postid, userid) {
        return await this.likes.where('user_id', userid).andWhere('post_id', postid).del();
    }
}

module.exports = BlogService;