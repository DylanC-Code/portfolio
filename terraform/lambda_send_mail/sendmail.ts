/* eslint-disable @typescript-eslint/no-require-imports */
const AWS = require('aws-sdk');
const ses = new AWS.SES();

exports.handler = async (event) => {
    const { name, email, message } = JSON.parse(event.body);

    const params = {
        Destination: {
            ToAddresses: [process.env.DESTINATION_MAIL]
        },
        Message: {
            Body: {
                Text: { Data: message }
            },
            Subject: { Data: `'${name}' send you a mail from ${email}` }
        },
        Source: process.env.SES_EMAIL
    };

    try {
        const data = await ses.sendEmail(params).promise();
        return {
            statusCode: 200,
            body: JSON.stringify({ message: 'Email sent successfully', data }),
        };
    } catch (error) {
        return {
            statusCode: 500,
            body: JSON.stringify({ message: 'Email sending failed', error }),
        };
    }
};
