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


const UserService = require('../services/user.service');
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
        const userService = new UserService();
        const user = await userService.signUp(req.body);
        return res.send(user);        
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(500, ' An error occured while creating the user')
        );
    }
};
exports.signIn = async(req, res, next) => {
    if(!req.body?.username) {
        return next(new ApiError(400, 'Username can not be empty'));
    }
    if(!req.body?.password) {
        return next(new ApiError(400, 'Password can not be empty'));
    }
    try {
        const userService = new UserService();
        const user = await userService.signIn(req.body.username, req.body.password);
        return res.send(user);        
    } catch (error) {
        console.log(error);
        return next(
            new ApiError(500, ' An error occured while login the user')
        );
    }
};
exports.findAllUser = async(req, res, next) => {
    let users = [];

    try{
        const userService = new UserService();
        const { keyword } = req.query;
        if (keyword) {
            users = await userService.findByUsername(keyword);
        } else {
            users = await userService.allUser();
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
        const userService = new UserService();
        const user = await userService.findByUserId(req.params.username);
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
        const userService = new UserService();
        const updated = await userService.updateUser(req.params.username, req.body);
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
        const userService = new UserService();
        const updated = await userService.updatePassUser(req.params.username, req.body);
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
        const userService = new UserService();
        const post = await userService.createPost(req.body);
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
        const userService = new UserService();
        const { keyword } = req.query;
        if (keyword) {
            posts = await userService.findByTitle(keyword);
        } else {
            posts = await userService.allPost();
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
        const userService = new UserService();
        const post = await userService.findByPostId(req.params.id);
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
        const userService = new UserService();
        const updated = await userService.update(req.params.id, req.body);
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
        const userService = new UserService();
        const deleted = await userService.delete(req.params.id);
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
