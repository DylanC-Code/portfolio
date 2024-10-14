<script lang="ts">
	import currentPage from '$lib/stores/currentPage';
	import { linear } from 'svelte/easing';

	export let component;
	export let name: string;

	function displayingPage(node: Element) {
		return {
			duration: 600,
			css: (t: number) => {
				const motion = linear(t);
				return `
					z-index: 10;
					opacity: ${1 * motion};
					transform: translateX(${100 - 100 * motion}%);
				`;
			}
		};
	}
</script>

{#if $currentPage === name}
	<section
		class="absolute left-0 top-0 z-10 h-full w-full overflow-y-auto overflow-x-hidden delay-[.6s] duration-[.6s] ease-linear"
		transition:displayingPage
	>
		<svelte:component this={component} />
	</section>
{/if}
