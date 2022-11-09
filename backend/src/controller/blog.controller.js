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

const BlogService = require('../services/blog.service');
const ApiError = require('../api-error');

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
}