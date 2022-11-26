const knex = require('../databases/knex');
class BlogService {
    constructor() {
        this.posts = knex('posts');
        this.likes = knex('likes');
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
            .count('likes.post_id', { as: 'numLike' }).groupBy('posts.post_id')
            .orderBy('post_dateUp', "desc");
    }
    async findByTitle(keyword) {
        return await this.posts
            .select('posts.post_id', 'user_name', 'user_usname', 'post_dateUp', 'post_title', 'post_content')
            .join('users', 'users.user_id', 'posts.user_id')
            .leftJoin('likes', 'posts.post_id', 'likes.post_id')
            .count('likes.post_id', { as: 'numLike' }).groupBy('posts.post_id')
            .where('post_title', 'like', `%${keyword}%`)
            .orderBy('post_dateUp', "desc");
    }

    async findByPostId(id) {
        return await this.posts
            .select('posts.post_id', 'user_name', 'user_usname', 'post_dateUp', 'post_title', 'post_content')
            .join('users', 'users.user_id', 'posts.user_id')
            .leftJoin('likes', 'posts.post_id', 'likes.post_id')
            .count('likes.post_id', { as: 'numLike' }).groupBy('posts.post_id')
            .where('posts.post_id', id).first();
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
}

module.exports = BlogService;