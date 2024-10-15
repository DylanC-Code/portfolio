import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';
import { purgeCss } from 'vite-plugin-tailwind-purgecss';

export default defineConfig({
	plugins: [
		sveltekit(),
		purgeCss({
			safelist: {
				greedy: [
					/((hover|focus):)?(bg|text|border|fill)-(warning|primary|success|tertiary|error|secondary)-(500)$/
				]
			}
		})
	]
});
