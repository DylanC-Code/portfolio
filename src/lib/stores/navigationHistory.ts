import { get, writable } from 'svelte/store';

const navigationHistory = writable<Array<string>>([]);

function push(pageName: string) {
	navigationHistory.update(($navigationHistory) => [...$navigationHistory, pageName]);
}

function pop() {
	let item: string;

	navigationHistory.update(($navigationHistory) => {
		item = $navigationHistory.pop() || 'home';
		return $navigationHistory;
	});

	return item;
}

export default {
	subscribe: navigationHistory.subscribe,
	push,
	pop,
	get length() {
		return get(navigationHistory).length;
	}
};
