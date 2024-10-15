import { browser } from '$app/environment';
import { get, writable } from 'svelte/store';

const currentPage = writable('home');

const navigationHistory: Array<string> = [];

function goto(pageName: string) {
	if (!browser) return;

	const currentPageName = get(currentPage);
	if (navigationHistory.length > 1) navigationHistory.push(currentPageName);

	currentPage.set(pageName);
}

function comeback() {
	const pageName = navigationHistory.pop() || 'home';

	currentPage.set(pageName);
}

export const navigator = {
	goto,
	comeback,
	gotoSetter: (pageName: string) => () => goto(pageName)
};

export default { subscribe: currentPage.subscribe };
