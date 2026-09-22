/// Доменные типы, общие для мобильного клиента и веб-фронтендов.
/// Значения совпадают с `packages/core/src/domain.ts` и enum на бэкенде.
library;

/// Оценка ответа в FSRS: 1 = не помню, 2 = трудно, 3 = хорошо, 4 = легко.
typedef Rating = int;

/// Состояние карточки в терминах FSRS.
typedef CardState = String;

const cardStateNew = 'new';
const cardStateLearning = 'learning';
const cardStateReview = 'review';
const cardStateRelearning = 'relearning';

const ratingAgain = 1;
const ratingHard = 2;
const ratingGood = 3;
const ratingEasy = 4;
