"""Web 面板 API 路由 — 向后兼容层 (委托给 web.api 包)"""


# 保持向后兼容: 旧代码 `from web.api import set_context` 仍有效
# 新代码  `from web.api.auth import get_routes` 可按模块导入
