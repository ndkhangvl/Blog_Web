import axios from "axios";
const url = import.meta.env.VITE_APP_API_URL;

class BlogService {
    constructor() {
        this.baseUrl = `${url}/api/users`;
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

    async signIn(user) {
        return (await this.api.post( `${url}/api/userLogin`, user)).data;
    }

    async createPost(post) {
        return (await this.api.post( `${url}/api/posts`, post)).data;
    }
}

export const blogService = new BlogService();