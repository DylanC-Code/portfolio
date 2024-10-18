<script lang="ts">
	import currentPage, { navigator } from '$lib/stores/currentPage';
	import navigationHistory from '$lib/stores/navigationHistory';
	import selectedColor from '$lib/stores/selectedColor';
	import { linear } from 'svelte/easing';

	export let component;
	export let name: string;
	export let classes = '';
	export let props = {};

	function displayingInPage(node: Element) {
		return {
			duration: 300,
			css: (t: number) => {
				const motion = linear(t);
				return `
					transform: translateX(${100 - 100 * motion}%);
				`;
			}
		};
	}

	$: pageInHistory = $navigationHistory.includes(name);

	function displayingOutPage(node: Element) {
		if (pageInHistory) return {};
		return displayingInPage(node);
	}
</script>

{#if $currentPage === name || pageInHistory}
	<section
		class="absolute left-0 top-0 z-10 h-full w-full overflow-y-auto overflow-x-hidden bg-surface-50 delay-[.6s] duration-[.6s] ease-linear {classes}"
		in:displayingInPage
		out:displayingOutPage
	>
		<button
			class:hidden={$currentPage === 'home'}
			class="fixed left-0 top-0 z-30 block h-[55px] w-[60px] rounded-br-[44px] bg-{$selectedColor} text-center leading-[54px] lg:hidden"
			on:click={() => navigator.comeback()}
		>
			<i class="fa fa-lg fa-arrow-left -ml-[6px]"></i>
		</button>

		<svelte:component this={component} {...props} />
	</section>
{/if}
