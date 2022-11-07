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