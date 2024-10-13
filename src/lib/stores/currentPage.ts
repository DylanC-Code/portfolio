import { browser } from '$app/environment';
import { page } from '$app/stores';
import { get, writable } from 'svelte/store';

const currentPage = writable('home');

if (browser) {
	let toUnsubscribe = false;

	const unsubscribe = page.subscribe(($page) => {
		if (toUnsubscribe) return unsubscribe();

		if (!$page.url) return;
		const defaultPage = $page.url.hash.replace('#', '');
		currentPage.set(defaultPage);

		toUnsubscribe = true;
	});
}

const navigationHistory: Array<string> = [];

function changeActivePage(pageName: string) {
	const elements = [...document.getElementsByClassName('page-section-active')];
	elements.forEach((element) => element.classList.remove('page-section-active'));

	const sectionElement = document.getElementById(pageName);
	if (sectionElement) sectionElement.classList.add('page-section-active');
}

function goto(pageName: string) {
	if (!browser) return;
	navigationHistory.push(get(currentPage));

	changeActivePage(pageName);
	currentPage.set(pageName);
}

function comeback() {
	const pageName = navigationHistory.pop() || 'home';

	changeActivePage(pageName);
	currentPage.set(pageName);
}

export const navigator = {
	goto,
	comeback,
	gotoSetter: (pageName: string) => () => goto(pageName)
};

export default { subscribe: currentPage.subscribe };
