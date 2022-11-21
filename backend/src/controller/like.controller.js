//api for Like
exports.changeLikeState = (req, res) => {
    return res.send({message: 'changeLikeState handler'});
};

const LikeService = require('../services/like.service');
const ApiError = require('../api-error');

//function for like
exports.changeLikeState = async (req, res, next) => {
    try {
        const likeService = new LikeService();
        const { userid, postid } = req.query;
        if (userid && postid) {
            const isLike = await likeService.isLike(postid, userid);
            if(isLike) {
                const likeService = new LikeService();
                const dislike = await likeService.updateDislike(postid, userid);
                if (!dislike) {
                    return next(new ApiError(404, 'Post or User not found'));
                }
                return res.send({ message: 'Dislike successfully'});
                
            } else {
                const likeService = new LikeService();
                const like = await likeService.updateLike(postid, userid);
                if(!like) {
                    return next(new ApiError(404, 'Post or User not found'));
                }
                return res.send({ message: 'Like successfully'});
            }
        }
    } catch(error) {
        console.log(error);
        return next(
            new ApiError(
                500,
                `Could not change like state with userid=${req.params.userid} and postid=${req.params.postid}`
            )
        );
    }
}