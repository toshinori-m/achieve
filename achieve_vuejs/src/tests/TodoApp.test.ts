import { mount } from '@vue/test-utils'
import TodoApp from '../components/TodoApp.vue'

test('completes a todo', async () => {
  const wrapper = mount(TodoApp)

  await wrapper.get('[data-test="todo-checkbox"]').setValue(true)

  expect(wrapper.get('[data-test="todo"]').classes()).toContain('completed')
})