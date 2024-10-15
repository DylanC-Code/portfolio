<script lang="ts">
	import currentPage, { navigator } from '$lib/stores/currentPage';
	import selectedColor from '$lib/stores/selectedColor';
	import { linear } from 'svelte/easing';

	export let component;
	export let name: string;
	export let classes = '';

	function displayingPage(node: Element) {
		return {
			duration: 600,
			css: (t: number) => {
				const motion = linear(t);
				return `
					z-index: 10;
					// opacity: ${1 * motion};
					transform: translateX(${100 - 100 * motion}%);
				`;
			}
		};
	}
</script>

{#if $currentPage === name}
	<section
		class="absolute left-0 top-0 z-10 h-full w-full overflow-y-auto overflow-x-hidden bg-surface-50 delay-[.6s] duration-[.6s] ease-linear {classes}"
		transition:displayingPage
	>
		<button
			class:hidden={$currentPage === 'home'}
			class="absolute z-20 block bg-{$selectedColor} left-0 top-0 h-[55px] w-[60px] rounded-br-[44px] text-center leading-[54px]"
			on:click={navigator.comeback}
		>
			<i class="fa fa-lg fa-arrow-left -ml-[6px]"></i>
		</button>
		<svelte:component this={component} />
	</section>
{/if}
