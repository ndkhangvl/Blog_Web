const knex = require('../databases/knex');
class BlogService {
    constructor() {
        this.posts = knex('posts');
        this.users = knex('users');
        this.likes = knex('likes');
    }

    //Define methods for accessing the database
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
}

module.exports = BlogService;