import { mount } from '@vue/test-utils'
import GoalForm from '../components/home/GoalForm.vue'

test('completes a todo', async () => {
  const wrapper = mount(GoalForm)

  await wrapper.get('[data-test="todo-checkbox"]').setValue(true)

  expect(wrapper.get('[data-test="todo"]').classes()).toContain('completed')
})