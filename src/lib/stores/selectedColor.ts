import { writable } from 'svelte/store';

export const colors = [
	'warning-500',
	'secondary-500',
	'primary-500',
	'success-500',
	'tertiary-500',
	'error-500'
];

export default writable(colors[0]);
