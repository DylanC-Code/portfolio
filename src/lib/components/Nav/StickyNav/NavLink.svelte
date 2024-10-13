<script lang="ts">
	import currentPage, { navigator } from '$lib/stores/currentPage';
	import { onMount } from 'svelte';
	import { linear } from 'svelte/easing';
	import { scale } from 'svelte/transition';

	export let delay: number;
	export let text: string;
	export let iconName: string;

	let mounted: boolean;

	const lowerCaseText = text.toLowerCase();
	const href = `#${lowerCaseText}`;

	const setPage = navigator.gotoSetter(lowerCaseText);

	function animateTick(node: Element) {
		return {
			duration: 150,
			delay,
			css: (t: number) => {
				const motion = linear(t);
				return `transform: translateX(${3 - 3 * motion}px) translateY(-${50 * motion}%) scaleY(${motion * 1});`;
			}
		};
	}

	onMount(() => (mounted = true));

	$: currentRoute = lowerCaseText === $currentPage;
</script>

<!-- svelte-ignore a11y-click-events-have-key-events -->
<!-- svelte-ignore a11y-no-noninteractive-element-interactions -->
<li class:text-red-500={currentRoute && mounted}>
	<a {href} class="relative grid h-[50px] grid-cols-[60px_60px] items-center" on:click={setPage}>
		<i
			class="fa fa-{iconName} fa-sm relative mx-auto font-awesome"
			class:opacity-60={!currentRoute}
			in:scale={{ delay, duration: 150, start: 0 }}
		>
		</i>

		<span
			class="absolute left-[57px] top-1/2 h-4 w-[3px] -translate-y-1/2"
			class:bg-red-500={currentRoute && mounted}
			class:hidden={!currentRoute}
			in:animateTick
		></span>

		<span class="animate-[slideIn_.15s_backwards] pl-4 font-normal">{text}</span>
	</a>
</li>

<style>
	@keyframes slideIn {
		from {
			opacity: 0;
			transform: translateX(-25px);
		}

		to {
			opacity: 1;
			transform: translateX(0);
		}
	}
	/* a span:last-of-type {
		animation: slideIn 0.15s backwards;
	} */
</style>
