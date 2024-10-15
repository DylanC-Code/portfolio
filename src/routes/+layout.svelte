<script lang="ts">
	import FullScreenNav from '$lib/components/Nav/FullScreenNav/FullScreenNav.svelte';
	import StickyNav from '$lib/components/Nav/StickyNav/StickyNav.svelte';
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

<div class="min-h-screen w-screen overflow-x-hidden contain-layout">
	<header class="relative z-30">
		<FullScreenNav />

		<!-- <header class="absolute bottom-0 left-0 right-0 top-0 z-30 h-full w-full p-0"> -->
		<StickyNav />
		<!-- </header> -->
	</header>

	<slot />
</div>
