**Модель обучающей площадки**

 На площадке есть курсы. По курсам с определенной периодичностью набираются группы студентов. Для того чтобы пройти курс, пользователь сначала выбирает группу и записывается в нее.
 
Нужно реализовать: - Индексную страницу со списком курсов и возможностью отсортировать их по ближайшей дате занятий (дата старта занятий в группе). Должен получиться список вида: название курса, ближайшая дата, количество студентов. - Страницу курса, на которой можно посмотреть все предстоящие группы со списками студентов, а так же записаться в группу.
 
Интерфейс для простоты сделать нестилизованным html, а запись в группу, например, путем указания email (не используйте devise, это лишнее). Предзаполнить базу несколькими тестовыми курасами и группами. Предусмотреть возможные ошибки.

**Демо:** https://pacific-lowlands-65517.herokuapp.com/

**Админка:** https://pacific-lowlands-65517.herokuapp.com/admin/courses

Систем-тесты просмотра курсов и записи в группу: `bin/rails test:system test`

