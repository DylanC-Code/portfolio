<script>
	import selectedColor from '$lib/stores/selectedColor';
</script>

<div class="mb-7 px-4 w-full flex-[0_0_100%] md:flex-[0_0_33%]">
	<!-- Start 'How to join me info' -->
	<div>
		<ul>
			<li>
				<h6>
					<span>Phone</span>
					<i class="fa fa-whatsapp text-{$selectedColor}"></i>
					<span>+33 6 50 32 29 56</span>
				</h6>
			</li>
			<li>
				<h6>
					<span>Email</span>
					<i class="fa fa-envelope-o text-{$selectedColor}"></i>
					<span>contact@dylan-castor.com</span>
				</h6>
			</li>
			<li>
				<h6>
					<span>Linkedin</span>
					<i class="fa fa-linkedin text-{$selectedColor}"></i>
					<span>dylan-code</span>
				</h6>
			</li>
		</ul>
	</div>
	<!-- End 'How to join me info' -->

	<div class="mt-7 mb-5">
		<h6 class="capitalize block mb-2 font-openSans text-[15px] opacity-80">Social profiles</h6>
		<ul class="m-0 flex gap-x-4">
			<li>
				<a
					href="https://www.linkedin.com/in/dylan-code/"
					target="_blank"
					class="border-{$selectedColor} text-{$selectedColor} hover:bg-{$selectedColor}"
				>
					<i class="fa fa-linkedin text-{$selectedColor}"></i>
				</a>
			</li>
			<li>
				<a
					href="https://www.linkedin.com/in/dylan-code/"
					target="_blank"
					class="border-{$selectedColor} text-{$selectedColor} hover:bg-{$selectedColor}"
				>
					<i class="fa fa-linkedin text-{$selectedColor}"></i>
				</a>
			</li>
			<li>
				<a
					href="https://www.linkedin.com/in/dylan-code/"
					target="_blank"
					class="border-{$selectedColor} text-{$selectedColor} hover:bg-{$selectedColor}"
				>
					<i class="fa fa-linkedin text-{$selectedColor}"></i>
				</a>
			</li>
		</ul>
	</div>
</div>

<style>
	li > h6 {
		text-transform: none;
	}

	li:not(:last-child) {
		padding-bottom: 25px;
	}

	a {
		@apply border rounded-full h-9 w-9 block text-center leading-9;
	}

	i {
		@apply bg-transparent;

		transform: rotateY(0deg);
		transition: 0.4s;
	}

	a:hover i {
		transform: rotateY(360deg);
		color: #fff;
	}

	/* Start 'How to join me info' */
	h6 > span:first-of-type {
		@apply capitalize block mb-2 font-openSans text-[15px] opacity-80 leading-[18px];
	}

	h6 > i {
		@apply pr-3;
	}

	h6 > span:last-of-type {
		@apply font-openSans font-medium leading-5 text-[17px];
	}
	/* End 'How to join me info' */
</style>
