import { join } from 'path';
import type { Config } from 'tailwindcss';
import forms from '@tailwindcss/forms';
import typography from '@tailwindcss/typography';
import { skeleton } from '@skeletonlabs/tw-plugin';
import { portfolio } from './src/portfolio';

export default {
	darkMode: 'class',
	content: [
		'./src/**/*.{html,js,svelte,ts}',
		join(require.resolve('@skeletonlabs/skeleton'), '../**/*.{html,js,svelte,ts}')
	],
	theme: {
		extend: {
			fontFamily: {
				poppins: ['poppins'],
				awesome: ['FontAwesome'],
				openSans: ['Open Sans']
			}
		}
	},
	safelist: [
		{
			pattern: /(bg|text|border)-.*(-500)?/
		},
	],
	plugins: [
		forms,
		typography,
		skeleton({
			themes: {
				custom: [portfolio]
			}
		})
	]
} satisfies Config;
