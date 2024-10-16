<script>
	import Button from '$lib/components/Button/Button.svelte';
	import selectedColor from '$lib/stores/selectedColor';
</script>

<form>
	<fieldset class="flex flex-wrap">
		<div class="relative mb-6 w-full">
			<i class="fa fa-user absolute left-6 top-[14px] text-sm opacity-30"></i>
			<input
				type="text"
				placeholder="YOUR NAME"
				class="h-12 w-full rounded-3xl border bg-[#333] pl-14 text-sm text-white"
			/>
		</div>

		<div class="relative mb-6 w-full">
			<i class="fa fa-envelope absolute left-6 top-[14px] text-sm opacity-30"></i>
			<input
				type="text"
				placeholder="YOUR EMAIL"
				class="h-12 w-full rounded-3xl border bg-[#333] pl-14 text-sm text-white"
			/>
		</div>

		<div class="relative mb-6 w-full">
			<i class="fa fa-comments absolute left-6 top-[14px] text-sm opacity-30"></i>
			<textarea
				name=""
				placeholder="YOUR MESSAGE"
				class="h-[130px] w-full resize-none rounded-3xl border bg-[#333] pb-4 pl-14 pt-4 text-sm text-white"
			></textarea>
		</div>
	</fieldset>

	<Button
		text="send message"
		elementClasses={{ button: `bg-${$selectedColor}`, icon: 'fa-solid fa-paper-plane' }}
	/>

	<div class="relative my-6 w-full">
		<span
			class="block h-11 rounded bg-green-600 text-center font-poppins text-sm font-semibold uppercase leading-[46px]"
		>
			<i class="fa fa-square-check mr-2"></i>
			Message Sent!
		</span>
	</div>
</form>
