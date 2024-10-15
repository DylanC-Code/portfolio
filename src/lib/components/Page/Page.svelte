<script lang="ts">
	import currentPage, { navigator } from '$lib/stores/currentPage';
	import selectedColor from '$lib/stores/selectedColor';
	import { linear } from 'svelte/easing';
	import { fade } from 'svelte/transition';

	export let component;
	export let name: string;
	export let classes = '';

	function displayingInPage(node: Element) {
		return {
			duration: 300,
			css: (t: number) => {
				const motion = linear(t);
				return `
					z-index: 10;
					transform: translateX(${100 - 100 * motion}%);
				`;
			}
		};
	}

	function displayingOutPage(node: Element) {
		if (window.innerWidth > 768) return fade(node, { delay: 300 });
		return displayingInPage(node);
	}
</script>

{#if $currentPage === name}
	<section
		class="absolute left-0 top-0 z-10 h-full w-full overflow-y-auto overflow-x-hidden bg-surface-50 delay-[.6s] duration-[.6s] ease-linear {classes}"
		in:displayingInPage
		out:displayingOutPage
	>
		<button
			class:hidden={$currentPage === 'home'}
			class="fixed left-0 top-0 z-20 block h-[55px] w-[60px] rounded-br-[44px] bg-{$selectedColor} text-center leading-[54px] md:hidden"
			on:click={() => navigator.comeback()}
		>
			<i class="fa fa-lg fa-arrow-left -ml-[6px]"></i>
		</button>

		<svelte:component this={component} />
	</section>
{/if}
