<script lang="ts">
	import { navigator } from '$lib/stores/currentPage';
	import selectedColor from '$lib/stores/selectedColor';

	export let text: string;
	export let hash: string;
	export let logo: string;
</script>

<li class="table block h-1/4 rounded-sm bg-[#333333] text-lg font-semibold">
	<button class="table-cell text-center align-middle" on:click={navigator.gotoSetter(hash)}>
		<i class="fa fa-{logo} mb-[10px] mt-[6px] block text-2xl text-{$selectedColor}"></i>
		<span>{text}</span>
	</button>
</li>
