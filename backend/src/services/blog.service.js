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
        Object.keys(user).forEach(function(key) {
            if(userProperties.indexOf(key) == -1) {
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
        return await this.users.select('*');
    }
    async findByUsername(keyword) {
        return await this.users
            .where('user_name', 'like', `%${keyword}%`)
            .orWhere('user_usname', 'like', `%${keyword}%`)
            .select('*');
    }

    async findByUserId(username){
        return await this.users.where('user_usname', username).select('*').first();
    }

    async updateUser(username, payload) {
        const update = this.#getUser(payload);
        return await this.users.where('user_usname', username).update(update);
    }

    //Define methods for accessing the database //POST
    #getPost(payload) {
        const post = { ...payload };
        const postProperties = [
            "user_id", "post_dateUp", "post_title", "post_content"
        ];
        //Remove non-user properties
        Object.keys(post).forEach(function(key) {
            if(postProperties.indexOf(key) == -1) {
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
        return await this.posts.select('*');
    }
    async findByTitle(keyword) {
        return await this.posts
            .where('post_title', 'like', `%${keyword}%`)
            .select('*');
    }
}

module.exports = BlogService;