<script lang="ts">
	import { navigator } from '$lib/stores/currentPage';
	import selectedColor from '$lib/stores/selectedColor';
	import Button from '../Button/Button.svelte';

	const aboutBtnClasses = {
		button: `mr-[25px] hover:text-white bg-${$selectedColor}`,
		animateDiv: 'bg-[#555]',
		textSpan: 'text-white',
		icon: 'text-white'
	};

	const portfolioBtnClasses = {
		button: `border bg-transparent border-${$selectedColor}`,
		animateDiv: `bg-${$selectedColor}`,
		textSpan: `text-${$selectedColor}`,
		icon: `text-${$selectedColor}`
	};
</script>

<div>
	<div class="text-left">
		<Button
			logo="user"
			text="more about me"
			onClickHandler={navigator.gotoSetter('about')}
			elementClasses={aboutBtnClasses}
		/>

		<Button
			text="portfolio"
			logo="suitcase"
			onClickHandler={navigator.gotoSetter('portfolio')}
			elementClasses={portfolioBtnClasses}
		/>
	</div>
</div>
