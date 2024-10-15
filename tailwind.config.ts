import type { Config } from 'tailwindcss';
// import forms from '@tailwindcss/forms';
import { skeleton } from '@skeletonlabs/tw-plugin';
// import typography from '@tailwindcss/typography';
import { join } from 'path';
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
			pattern:
				// /(bg|text|(border|border-l)|fill)-(warning|primary|success|tertiary|error|secondary)-(500)/,
				/(bg|text|border|fill)-(warning|primary|success|tertiary|error|secondary)-(500)$/,
			variants: ['hover', 'focus']
		},
		'bg-warning-500'
	],
	plugins: [
		// forms,
		// typography,
		skeleton({
			themes: {
				custom: [portfolio]
			}
		})
	]
} satisfies Config;
