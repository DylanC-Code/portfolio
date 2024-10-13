<script lang="ts">
	import selectedColor from '$lib/stores/selectedColor';

	export let onClickHandler = () => {};
	export let logo = '';
	export let text: string;
	export let classes = '';
</script>

<button on:click={onClickHandler} class="bg-{$selectedColor} {classes}">
	<div class="bg-[#555]"></div>
	<span><i class="fa fa-{logo}"></i>{text}</span>
</button>

<style>
	button {
		@apply text-[15px] font-medium rounded-[26px] h-11 uppercase px-[33px] outline-none overflow-hidden inline-block relative font-poppins tracking-[0.5px];
	}

	button > div {
		@apply absolute top-0 -left-1/4 w-0 z-10 duration-[.6s] h-[102%];
		transform: skew(-22deg);
	}

	button > span {
		@apply relative z-20 font-poppins duration-150;
	}

	button i {
		@apply duration-150 pr-[11px];
	}

	button:hover > div {
		width: 180%;
	}
</style>
