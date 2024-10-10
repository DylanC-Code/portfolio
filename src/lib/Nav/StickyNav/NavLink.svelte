<script lang="ts">
	import { onMount } from 'svelte';
	import { linear } from 'svelte/easing';
	import { scale } from 'svelte/transition';
	import { _currentPage } from '../../../routes/+layout';

	export let delay: number;
	export let text: string;
	export let iconName: string;

	let mounted: boolean;

	const lowerCaseText = text.toLowerCase();
	const href = `#${lowerCaseText}`;

	const setPage = _currentPage.createPageSetter(lowerCaseText);

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

	$: currentRoute = lowerCaseText === $_currentPage;
</script>

<!-- svelte-ignore a11y-click-events-have-key-events -->
<!-- svelte-ignore a11y-no-noninteractive-element-interactions -->
<li class:text-red-500={currentRoute && mounted}>
	<a {href} class="sticky-nav-link" on:click={setPage}>
		<i
			class="fa fa-{iconName} fa-sm font-awesome mx-auto relative"
			class:opacity-60={!currentRoute}
			in:scale={{ delay, duration: 150, start: 0 }}
		>
		</i>

		<span
			class="w-[3px] h-4 absolute left-[57px] top-1/2 -translate-y-1/2"
			class:bg-red-500={currentRoute && mounted}
			class:hidden={!currentRoute}
			in:animateTick
		></span>

		<span class="pl-4 font-normal">{text}</span>
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
	a span:last-of-type {
		animation: slideIn 0.15s backwards;
	}
</style>
