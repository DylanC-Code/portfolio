import { join } from 'path';
import type { Config } from 'tailwindcss';
// import forms from '@tailwindcss/forms';
import { skeleton } from '@skeletonlabs/tw-plugin';
import typography from '@tailwindcss/typography';
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
				sans: ['Poppins'],
				poppins: ['Poppins'],
				awesome: ['FontAwesome'],
				openSans: ['Open Sans']
			},
			height: {
				dvh: '100dvh'
			}
		}
	},
	safelist: [
		{
			pattern: /(bg|text|border)-warning-(500)?/,
			variants: ['hover']
		}
	],
	plugins: [
		// forms,
		typography,
		skeleton({
			themes: {
				custom: [portfolio]
			}
		})
	]
} satisfies Config;
