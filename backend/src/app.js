const express = require('express');
const cors = require('cors');

const app = express();

const blogController = require('./controller/blog.controller');
const userController = require('./controller/user.controller');
const likeController = require('./controller/like.controller');

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.json({message: 'Welcome to Blog Web application.'});
});
//route for post
app.route('/api/posts')
    .get(blogController.findAll)
    .post(blogController.create);

app.route('/api/posts/:id')
    .get(blogController.findOne)
    .put(blogController.update)
    .delete(blogController.delete);

//route for user
app.route('/api/users')
    .post(userController.signUp)
    .get(userController.findAllUser);

app.route('/api/users/:username')
    .get(userController.seeDetailUser)
    .put(userController.updateUser);

app.route('/api/users/:username/get-post')
    .get(blogController.getPostBy);

app.route('/api/users/:username/change-password')
    .put(userController.updatePass);

app.route('/api/userLogin')
    .post(userController.signIn);
    
//route for like
app.route('/api/likes')
    .put(likeController.changeLikeState)
    .get(likeController.checkLike);

//Link Error 404 and status code 500
const ApiError = require('./api-error');
app.use((req, res, next) => {
    return next(new ApiError(404, 'Resource not found'));
    });

app.use((error, req, res, next) => {
    return res.status(error.statusCode || 500).json({
        message: error.message || 'Internal Server Error',
    });
});

module.exports = app;