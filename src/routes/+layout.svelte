<script lang="ts">
	import FullScreenNav from '../lib/Nav/FullScreenNav/FullScreenNav.svelte';

	import StickyNav from '../lib/Nav/StickyNav/StickyNav.svelte';

	import '../app.postcss';

	// // Highlight JS
	// import hljs from 'highlight.js/lib/core';
	// import 'highlight.js/styles/github-dark.css';
	// import { storeHighlightJs } from '@skeletonlabs/skeleton';
	// import xml from 'highlight.js/lib/languages/xml'; // for HTML
	// import css from 'highlight.js/lib/languages/css';
	// import javascript from 'highlight.js/lib/languages/javascript';
	// import typescript from 'highlight.js/lib/languages/typescript';

	// hljs.registerLanguage('xml', xml); // for HTML
	// hljs.registerLanguage('css', css);
	// hljs.registerLanguage('javascript', javascript);
	// hljs.registerLanguage('typescript', typescript);
	// storeHighlightJs.set(hljs);

	// // Floating UI for Popups
	// import { computePosition, autoUpdate, flip, shift, offset, arrow } from '@floating-ui/dom';
	// import { storePopup } from '@skeletonlabs/skeleton';
	// storePopup.set({ computePosition, autoUpdate, flip, shift, offset, arrow });
</script>

<!-- <header class="absolute top-0 left-0 bottom-0 right-0 p-0 h-full w-full"> -->
 
<header class="top-0 left-0 bottom-0 right-0 p-0 h-full w-full">
	<nav class="font-poppins font-semibold uppercase text-white">
		<FullScreenNav />

		<StickyNav />
	</nav>
</header>

<slot />
