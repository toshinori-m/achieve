import { mount } from '@vue/test-utils'
import MonthlyGoal from '../components/home/MonthlyGoalForm.vue'
import flushPromises from 'flush-promises'
import axios from "axios"
import User from '@/components/UserList.vue';

beforeEach(() => {
  jest.clearAllMocks()
})

jest.mock("axios", () => ({
  get: jest.fn(() => Promise.resolve({ data: [
        {id:1,name:"Leanne Graham"},
        {id:2,name:"Ervin Howell"},
      ]
  }))
})
);

describe('User', () => {
  it("mount render a child component",async() => {
    const wrapper = mount(User);
    await flushPromises()
    expect(axios.get).toHaveBeenCalledTimes(1)
    expect(axios.get).toHaveBeenCalled()
    expect(axios.get).toHaveBeenCalledWith('https://jsonplaceholder.typicode.com/users')
    const users = wrapper.findAll('li')
    expect(users).toHaveLength(2)
    expect(users[0].text()).toContain('Leanne')
    expect(users[1].text()).toContain('Howell')    
  })
})

describe('monthly_goal.aim index', () => {
  it('creates a monthly_goal', async () => {
    const wrapper = mount(MonthlyGoal)
    await wrapper.setData({
      monthly_goals:true
    })
    const monthly_goals = wrapper.find('button');
    expect(monthly_goals.exists()).toBe(true)
  })
})

describe('Goal.vue', () => {
  it('クリック時に$route.pushが実行される', () => {
    const mockRouterPush = jest.fn();
    const app_mount = mount(MonthlyGoal, {
      global: {
        mocks: {
          $router: {
            push: mockRouterPush
          },
        }
      }
    });
    expect(mockRouterPush.mock.calls.length).toBe(0);
    app_mount.find('button').trigger('submit');
    expect(mockRouterPush.mock.calls.length).toBe(1);
  });

  it('$route.pushの引数が正しい', () => {
    const mockRouterPush = jest.fn();
    const app_mount = mount(MonthlyGoal, {
      global: {
        mocks: {
          $router: {
            push: mockRouterPush
          },
        }
      }
    });
    app_mount.find('button').trigger('submit');
    expect(mockRouterPush).toHaveBeenCalledWith({
      name: 'MonthlyGoalPage'
    });
  });
});