<script lang="ts">
	import Button from '$lib/components/Button/Button.svelte';
	import selectedColor from '$lib/stores/selectedColor';

	const messageSent = localStorage.getItem('messageSent');

	const info = {
		name: 'dylan',
		email: 'dylan@gmail.com',
		message:
			'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Delectus placeat quam, ea, accusamus ab, sint aspernatur umquam temporibus ipsum doloremque fugiat amet tempora excepturi sequi corporis possimus saepe autem et.Accusantium pariatur, necessitatibus ad suscipit molestiae possimus eius esse sunt, et architecto temporibus nisi tempora enim. Unde porro, sit minus, vitae ut pariatur quibusdam, quia eum est sequi quod molestias?'
	};

	async function sendMessageHandler(e) {
		e.preventDefault();
		const response = await fetch('/send-message', {
			method: 'POST',
			body: JSON.stringify(info),
			headers: {
				'Content-Type': 'application/json'
			}
		});

		const parsedResponse = await response.json();
		console.log('🚀 ~ sendMessageHandler ~ parsedResponse:', parsedResponse);
		// if(parsedResponse.)
	}
</script>

<form method="post" action="/send-message" on:submit={sendMessageHandler}>
	<fieldset class="flex flex-wrap">
		<div class="relative mb-6 w-full">
			<i class="fa fa-user absolute left-6 top-[14px] text-sm opacity-30"></i>
			<input
				type="text"
				placeholder="YOUR NAME"
				required
				bind:value={info.name}
				minlength="2"
				maxlength="255"
				class="h-12 w-full rounded-3xl border bg-[#333] pl-14 text-sm text-white"
			/>
		</div>

		<div class="relative mb-6 w-full">
			<i class="fa fa-envelope absolute left-6 top-[14px] text-sm opacity-30"></i>
			<input
				type="email"
				required
				bind:value={info.email}
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
				placeholder="YOUR MESSAGE"
				class="h-[130px] w-full resize-none rounded-3xl border bg-[#333] pb-4 pl-14 pt-4 text-sm text-white"
			></textarea>
		</div>
	</fieldset>

	<Button
		text="send message"
		elementClasses={{ button: `bg-${$selectedColor}`, icon: 'fa-solid fa-paper-plane' }}
	/>

	<div class="relative my-6 w-full" class:hidden={!messageSent}>
		<span
			class="block h-11 rounded bg-green-600 text-center font-poppins text-sm font-semibold uppercase leading-[46px]"
		>
			<i class="fa fa-square-check mr-2"></i>
			Message Sent!
		</span>
	</div>
</form>
