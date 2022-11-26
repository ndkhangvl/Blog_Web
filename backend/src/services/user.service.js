const knex = require('../databases/knex');
class UserService {
    constructor() {
        this.users = knex('users');
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
    
    async signIn(username, password) {
        return await this.users
            .select('user_id')
            .where('user_usname', `${username}`)
            .andWhere('user_passwd', `${password}`).first();
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
}

module.exports = UserService;