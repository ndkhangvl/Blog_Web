const knex = require('../databases/knex');
class LikeService {
    constructor() {
        this.likes = knex('likes');
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

module.exports = LikeService;