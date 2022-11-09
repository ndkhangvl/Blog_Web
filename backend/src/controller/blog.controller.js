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


//const ContactService = require('../services/blog.service');
const ApiError = require('../api-error');

exports.create = async(req, res, next) => {
    if(!req.body?.name) {
        return next(new ApiError(400, 'Name can not be empty'));
    }

    // try {
    //     const contactService = new ContactService();
    //     const contact = await contactService.create(req.body);
    //     return res.send(contact);        
    // } catch (error) {
    //     console.log(error);
    //     return next(
    //         new ApiError(500, ' An error occured while creating the contact')
    //     );
    // }
}