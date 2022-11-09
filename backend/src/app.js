const express = require('express');
const cors = require('cors');

const app = express();

const blogController = require('./controller/blog.controller');

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.json({message: 'Welcome to Blog Web application.'});
});
app.route('/api/blogs')
    .get(blogController.findAll)
    .post(blogController.create);

app.route('/api/blogs/:id')
    .get(blogController.findOne)
    .put(blogController.update)
    .delete(blogController.delete);

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