<script>
	import Button from '$lib/components/Button/Button.svelte';
</script>

<form>
	<fieldset class="flex flex-wrap">
		<div>
			<i class="fa fa-user"></i>
			<input type="text" placeholder="YOUR NAME" />
		</div>

		<div>
			<i class="fa fa-envelope"></i>
			<input type="text" placeholder="YOUR EMAIL" />
		</div>

		<div>
			<i class="fa fa-comments"></i>
			<textarea name="" id="" placeholder="YOUR MESSAGE" class="pt-4 pb-4 h-[130px] resize-none"
			></textarea>
		</div>
	</fieldset>

	<Button text="send message" logo="send" />

	<div class="my-6">
		<span
			class="block h-11 rounded bg-green-600 uppercase font-semibold leading-[46px] text-center text-sm font-poppins"
		>
			<i class="fa fa-square-check mr-2"></i>
			Message Sent!
		</span>
	</div>
</form>

<style>
	div {
		@apply mb-6 w-full relative;
	}

	div > i {
		@apply absolute left-6 top-[14px] opacity-30 text-sm;
	}

	input {
		@apply h-12;
	}

	input,
	textarea {
		@apply border w-full text-white text-sm bg-[#333] pl-14 rounded-3xl;
	}
</style>
