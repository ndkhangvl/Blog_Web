import axios from "axios";
const url = import.meta.env.VITE_APP_API_URL;

class BlogService {
    constructor() {
        this.baseUrl = `${url}/api/users`;
        this.baseUrlPost = `${url}/api/posts`;
        this.api = axios.create({
            headers: {
                'Content-Type': 'application/json',
                Accept: 'application/json',
            },
        });
    }

    async signUp(user) {
        return (await this.api.post(this.baseUrl, user)).data;
    }
    async getManyPost() {
        return (await this.api.get(this.baseUrlPost)).data;
    }
    async getPost(id) {
        return (await this.api.get(`${this.baseUrlPost}/${id}`)).data;
    }
    
    async signIn(user) {
        return (await this.api.post( `${url}/api/userLogin`, user)).data;
    }

    async createPost(post) {
        return (await this.api.post( `${url}/api/posts`, post)).data;

    }

    async getAllUser() {
        return (await this.api.get(this.baseUrl)).data;
    }

    async checkLike(userid, postid) {
        return (await this.api.get(`${url}/api/likes?userid=${userid}&postid=${postid}`)).data;
    }
    async actionLike(userid, postid) {
        return (await this.api.put(`${url}/api/likes?userid=${userid}&postid=${postid}`)).data;
    }
}

export const blogService = new BlogService();