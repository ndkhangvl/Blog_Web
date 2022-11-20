//api for blog handler
exports.create = (req, res) => {
    return res.send({message: 'create blog handler'});
};
exports.findAll = (req, res) => {
    return res.send({message: 'findAll blog handler'});
};
exports.findOne = (req, res) => {
    return res.send({message: 'findOne blog handler'});
};
exports.update = (req, res) => {
    return res.send({message: 'update blog handler'});
};
exports.delete = (req, res) => {
    return res.send({message: 'delete blog handler'});
};

//api for user handler
exports.signUp = (req, res) => {
    return res.send({message: 'signUp user handler'});
};
exports.signIn = (req, res) => {
    return res.send({message: 'signIn user handler'});
};
exports.seeDetailUser = (req, res) => {
    return res.send({message: 'seeDetailUser user handler'});
};
exports.updateUser = (req, res) => {
    return res.send({message: 'updateUser user handler'});
};
exports.findAllUser = (req, res) => {
    return res.send({message: 'findAllUser user handler'});
};
//api for Like
exports.changeLikeState = (req, res) => {
    return res.send({message: 'changeLikeState handler'});
};

const BlogService = require('../services/blog.service');
const ApiError = require('../api-error');

//functions for user
exports.signUp = async(req, res, next) => {
    if(!req.body?.user_usname) {
        return next(new ApiError(400, 'Username can not be empty'));
    }
    if(!req.body?.user_passwd) {
        return next(new ApiError(400, 'Password can not be empty'));
    }
    try {
        const blogService = new BlogService();
        const user = await blogService.signUp(req.body);
        return res.send(user);        
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(500, ' An error occured while creating the user')
        );
    }
};

exports.findAllUser = async(req, res, next) => {
    let users = [];

    try{
        const blogService = new BlogService();
        const { keyword } = req.query;
        if (keyword) {
            users = await blogService.findByUsername(keyword);
        } else {
            users = await blogService.allUser();
        }
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(500, 'An error occured while retrieving users')
        );
    }

    return res.send(users);
};

exports.seeDetailUser = async(req, res, next) => {
    try {
        const blogService = new BlogService();
        const user = await blogService.findByUserId(req.params.username);
        if(!user) {
            return next(new ApiError(404, 'User not found'));
        }
        return res.send(user);
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(
                500,
                `Error retrieving user with username=${req.params.username}`
            )
        );
    }
};

exports.updateUser = async (req, res, next) => {
    if(Object.keys(req.body).length === 0) {
        return next(new ApiError(400, 'Data to update can not be empty'));
    }
    try {
        const blogService = new BlogService();
        const updated = await blogService.updateUser(req.params.username, req.body);
        if (!updated) {
            return next(new ApiError(404, 'User not found'));
        }
        return  res.send({ message: 'User was updated successfully' });
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(500, `Error updating contact with username=${req.params.username}`)
        );
    }
};

exports.updatePass = async (req, res, next) => {
    if(Object.keys(req.body).length === 0) {
        return next(new ApiError(400, 'Data to update can not be empty'));
    }
    try {
        const blogService = new BlogService();
        const updated = await blogService.updatePassUser(req.params.username, req.body);
        if (!updated) {
            return next(new ApiError(404, 'User not found'));
        }
        return  res.send({ message: 'User was updated successfully' });
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(500, `Error updating password with username=${req.params.username}`)
        );
    }
};
//functions for post
exports.create = async (req, res, next) =>{
    if(!req.body?.post_title) {
        return next(new ApiError(400, 'Title post can not be empty'));
    }
    try {
        const blogService = new BlogService();
        const post = await blogService.createPost(req.body);
        return res.send(post);        
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(500, ' An error occured while creating the post')
        );
    }
};

exports.findAll = async(req, res, next) => {
    let posts = [];

    try{
        const blogService = new BlogService();
        const { keyword } = req.query;
        if (keyword) {
            posts = await blogService.findByTitle(keyword);
        } else {
            posts = await blogService.allPost();
        }
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(500, 'An error occured while retrieving posts')
        );
    }

    return res.send(posts);
};

exports.findOne = async(req, res, next) => {
    try {
        const blogService = new BlogService();
        const post = await blogService.findByPostId(req.params.id);
        if(!post) {
            return next(new ApiError(404, 'Post not found'));
        }
        return res.send(post);
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(
                500,
                `Error retrieving user with id=${req.params.id}`
            )
        );
    }
};

exports.update = async (req, res, next) => {
    if(Object.keys(req.body).length === 0) {
        return next(new ApiError(400, 'Data to update can not be empty'));
    }
    try {
        const blogService = new BlogService();
        const updated = await blogService.update(req.params.id, req.body);
        if (!updated) {
            return next(new ApiError(404, 'Post not found'));
        }
        return  res.send({ message: 'Post was updated successfully' });
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(500, `Error updating post with id=${req.params.id}`)
        );
    }
};

exports.delete = async (req, res, next) => {
    try {
        const blogService = new BlogService();
        const deleted = await blogService.delete(req.params.id);
        if (!deleted) {
            return next(new ApiError(404, 'Post not found'));
        }
        return res.send({ message: 'Post was deleted successfully'});
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(
                500,
                `Could not delete post with id=${req.params.id}`
            )
        );
    }
};

//function for like
exports.changeLikeState = async (req, res, next) => {
    try {
        const blogService = new BlogService();
        const { userid, postid } = req.query;
        if (userid && postid) {
            const isLike = await blogService.isLike(postid, userid);
            if(isLike) {
                const blogService = new BlogService();
                const dislike = await blogService.updateDislike(postid, userid);
                if (!dislike) {
                    return next(new ApiError(404, 'Post or User not found'));
                }
                return res.send({ message: 'Dislike successfully'});
                
            } else {
                const blogService = new BlogService();
                const like = await blogService.updateLike(postid, userid);
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