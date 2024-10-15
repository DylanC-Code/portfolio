<script lang="ts">
	import ColorChanger from '$components/ColorChanger/ColorChanger.svelte';
	import FullScreenNav from '$lib/components/Nav/FullScreenNav/FullScreenNav.svelte';
	import StickyNav from '$lib/components/Nav/StickyNav/StickyNav.svelte';
	import '../app.postcss';

	import { computePosition, autoUpdate, offset, shift, flip, arrow } from '@floating-ui/dom';
	import { storePopup } from '@skeletonlabs/skeleton';

	storePopup.set({ computePosition, autoUpdate, offset, shift, flip, arrow });
</script>

<div class="min-h-dvh w-screen overflow-x-hidden contain-layout">
	<header>
		<FullScreenNav />

		<StickyNav />
	</header>

	<ColorChanger />

	<slot />
</div>
