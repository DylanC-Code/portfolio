<script lang="ts">
	import { navigator } from '$lib/stores/currentPage';
	import selectedColor from '$lib/stores/selectedColor';

	export let text: string;
	export let hash: string;
	export let logo: string;
</script>

<!-- svelte-ignore a11y-click-events-have-key-events -->
<!-- svelte-ignore a11y-no-noninteractive-element-interactions -->
<li
	on:click={navigator.gotoSetter(hash)}
	class="flex w-full justify-center rounded-sm bg-[#333333] align-middle text-lg font-semibold sm:text-[28px] sm:font-semibold sm:leading-[42px]"
>
	<button on:click={navigator.gotoSetter(hash)}>
		<i class="fa fa-{logo} mb-[10px] mt-[6px] block text-2xl text-{$selectedColor} sm:text-4xl"></i>
		<span class="uppercase">{text}</span>
	</button>
</li>
