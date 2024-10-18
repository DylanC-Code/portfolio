<script lang="ts">
	import Button from '$lib/components/Button/Button.svelte';
	import selectedColor from '$lib/stores/selectedColor';
	import { env } from '$env/dynamic/public';

	let messageSent = Boolean(localStorage.getItem('messageSent'));
	let error: string;

	const info = {
		name: '',
		email: '',
		message: ''
	};

	async function sendMessageHandler(e: Event) {
		e.preventDefault();
		const response = await fetch(`${env.PUBLIC_SERVER_ADDRESS}/send-mail`, {
			method: 'POST',
			body: JSON.stringify(info)
		});

		const parsedResponse = await response.json();

		if (parsedResponse.error) return (error = parsedResponse.error);

		messageSent = true;
		error = '';

		localStorage.setItem('messageSent', 'true');
	}
</script>

<form method="post" action="/send-message" on:submit={sendMessageHandler}>
	<fieldset class="flex flex-wrap">
		<div class="relative mb-6 w-full">
			<i class="fa fa-user absolute left-6 top-[14px] text-sm opacity-30"></i>
			<input
				type="text"
				autocomplete="given-name"
				placeholder="YOUR NAME"
				bind:value={info.name}
				disabled={messageSent}
				minlength="2"
				maxlength="255"
				class:cursor-not-allowed={messageSent}
				class="h-12 w-full rounded-3xl border bg-[#333] pl-14 text-sm text-white"
			/>
		</div>

		<div class="relative mb-6 w-full">
			<i class="fa fa-envelope absolute left-6 top-[14px] text-sm opacity-30"></i>
			<input
				type="email"
				required
				bind:value={info.email}
				disabled={messageSent}
				class:cursor-not-allowed={messageSent}
				placeholder="YOUR EMAIL"
				class="h-12 w-full rounded-3xl border bg-[#333] pl-14 text-sm text-white"
			/>
		</div>

		<div class="relative mb-6 w-full">
			<i class="fa fa-comments absolute left-6 top-[14px] text-sm opacity-30"></i>
			<textarea
				minlength="20"
				maxlength="500"
				required
				bind:value={info.message}
				disabled={messageSent}
				class:cursor-not-allowed={messageSent}
				placeholder="YOUR MESSAGE"
				class="h-[130px] w-full resize-none rounded-3xl border bg-[#333] pb-4 pl-14 pt-4 text-sm text-white"
			></textarea>
		</div>
	</fieldset>

	<Button
		text="send message"
		elementClasses={{
			button: `bg-${$selectedColor} ${messageSent ? 'cursor-not-allowed' : ''}`,
			icon: 'fa-solid fa-paper-plane'
		}}
		disabled={messageSent}
	/>

	<div class="relative my-6 w-full" class:hidden={!messageSent}>
		<span
			class="block h-11 rounded bg-green-600 text-center font-poppins text-sm font-semibold uppercase leading-[46px]"
		>
			<i class="fa fa-square-check mr-2"></i>
			Message Sent!
		</span>
	</div>
	<div class="relative my-6 w-full" class:hidden={!error}>
		<span
			class="block h-11 rounded bg-error-600 text-center font-poppins text-sm font-semibold uppercase leading-[46px]"
		>
			<i class="fa fa-triangle-exclamation mr-2"></i>
			{error}
		</span>
	</div>
</form>
