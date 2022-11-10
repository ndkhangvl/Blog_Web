import axios from "axios";
const url = import.meta.env.VITE_APP_API_URL;

class BlogService {
    constructor() {
        this.baseUrl = `${url}/api/posts`;
        this.api = axios.create({
            headers: {
                'Content-Type': 'application/json',
                Accept: 'application/json',
            },
        });
    }
}

export const blogService = new BlogService();