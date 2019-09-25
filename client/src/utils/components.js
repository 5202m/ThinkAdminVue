import home from '@/views/public/Home'
import department from '@/views/organization/department/Index'
import position from '@/views/organization/position/Index'
import user from '@/views/organization/user/Index'
import menu from '@/views/system/menu/Index'
import rule from '@/views/system/rule/Index'
import category from '@/views/shop/category/Index'
import good from '@/views/shop/goods/Index'
import goodAdd from '@/views/shop/goods/Add'

let comps = {
  'home': home,
  'menu': menu,
  'department': department,
  'position': position,
  'user': user,
  'rule': rule,
  'category': category,
  'good': good,
  'goodAdd': goodAdd
}
export default comps
