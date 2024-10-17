import { SESClient, SendEmailCommand } from '@aws-sdk/client-ses';
const ses = new SESClient({ region: 'eu-west-3' });

export const sendmail = async (event) => {
	const { name, email, message } = JSON.parse(event.body);

	const destinationEmail = process.env.DESTINATION_EMAIL;
	let error;
	if (typeof destinationEmail !== 'string') error = Error('Destination mail missing');
	if (typeof name !== 'string' || name.length < 2) error = Error('Name missing');
	if (typeof email !== 'string' || !email) error = Error('Email missing');
	if (typeof message !== 'string' || message.length < 20) error = Error('Message missing');

	const command = new SendEmailCommand({
		Destination: {
			ToAddresses: [destinationEmail]
		},
		Message: {
			Body: {
				Text: { Data: message }
			},

			Subject: { Data: `'${email}' (${name}) send you a mail from ${process.env.DOMAIN_NAME}` }
		},
		Source: process.env.SES_EMAIL_FROM
	});

	const headers = {
		'Access-Control-Allow-Headers': 'Content-Type',
		'Access-Control-Allow-Origin': '*',
		'Access-Control-Allow-Methods': 'OPTIONS,POST,GET'
	};

	if (error)
		return {
			statusCode: 403,
			headers,
			body: JSON.stringify({ message: 'Sending message error', error: error.message })
		};

	try {
		await ses.send(command);
		return {
			statusCode: 200,
			headers,
			body: JSON.stringify({ message: 'Email successfully sent' })
		};
	} catch (error) {
		return {
			statusCode: 500,
			headers,
			body: JSON.stringify({ message: 'Sending message error', error: error.message })
		};
	}
};
