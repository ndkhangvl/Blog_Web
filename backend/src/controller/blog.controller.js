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

const BlogService = require('../services/blog.service');
const ApiError = require('../api-error');

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