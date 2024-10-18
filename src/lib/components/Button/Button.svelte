<script lang="ts">
	interface IButtonClasses {
		button?: string;
		animateDiv?: string;
		textSpan?: string;
		icon?: string;
	}

	export let onClickHandler = () => {};
	export let text: string;
	export let elementClasses: { [K in keyof IButtonClasses]?: string };
	export let disabled = false;

	const defaultElementClasses: IButtonClasses = {
		button: '',
		animateDiv: '',
		textSpan: '',
		icon: ''
	};

	$: classes = { ...defaultElementClasses, ...elementClasses };
</script>

<button
	on:click={onClickHandler}
	class="relative inline-block h-11 overflow-hidden rounded-[26px] px-[33px] font-poppins text-[15px] font-medium uppercase tracking-[0.5px] outline-none {classes.button}"
	{disabled}
>
	<div
		class="absolute -left-1/4 top-0 z-10 h-[102%] w-0 skew-x-[22deg] bg-[#555] duration-[.6s] {classes.animateDiv}"
	></div>
	<span class="relative z-20 font-poppins duration-150 {classes.textSpan}">
		<i class="pr-[11px] duration-150 {classes.icon}"></i>{text}
	</span>
</button>

<style>
	button:hover > div {
		width: 180%;
	}
</style>
