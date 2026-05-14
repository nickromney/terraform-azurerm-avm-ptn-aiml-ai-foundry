variable "ai_agent_host_name" {
  type        = string
  description = "Name of the AI agent capability host"
}

variable "ai_foundry_id" {
  type        = string
  description = "Resource ID of the AI Foundry account"
}

variable "description" {
  type        = string
  description = "Description for the AI Foundry project"
}

variable "display_name" {
  type        = string
  description = "Display name for the AI Foundry project"
}

variable "location" {
  type        = string
  description = "Azure region for deployment"
  nullable    = false
}

variable "name" {
  type        = string
  description = "Name of the AI Foundry project"
}

variable "account_capability_host_id" {
  type        = string
  default     = null
  description = "Resource ID of the account-level capability host (if exists) to ensure it completes before project capability host creation"
}

variable "ai_search_id" {
  type        = string
  default     = null
  description = "Resource ID of the AI Search service"
}

variable "ai_search_location" {
  type        = string
  default     = null
  description = "Azure region of the AI Search service. Defaults to the project location."
}

variable "ai_search_auth_type" {
  type        = string
  default     = "ManagedIdentity"
  description = "Authentication type for the AI Search project connection."

  validation {
    condition     = contains(["AAD", "ApiKey", "ManagedIdentity"], var.ai_search_auth_type)
    error_message = "ai_search_auth_type must be one of: AAD, ApiKey, ManagedIdentity."
  }
}

variable "ai_search_use_project_identity" {
  type        = bool
  default     = null
  description = "Whether the AI Search project connection uses the project/workspace managed identity. Defaults to true when auth_type is ManagedIdentity."
}

variable "create_ai_search_connection" {
  type        = bool
  default     = false
  description = "Whether to create a project connection and RBAC for the AI Search service."
}

variable "cosmos_db_id" {
  type        = string
  default     = null
  description = "Resource ID of the Cosmos DB account"
}

variable "cosmos_db_location" {
  type        = string
  default     = null
  description = "Azure region of the Cosmos DB account. Defaults to the project location."
}

variable "cosmos_db_auth_type" {
  type        = string
  default     = "ManagedIdentity"
  description = "Authentication type for the Cosmos DB project connection."

  validation {
    condition     = contains(["AAD", "ApiKey", "ManagedIdentity"], var.cosmos_db_auth_type)
    error_message = "cosmos_db_auth_type must be one of: AAD, ApiKey, ManagedIdentity."
  }
}

variable "cosmos_db_use_project_identity" {
  type        = bool
  default     = null
  description = "Whether the Cosmos DB project connection uses the project/workspace managed identity. Defaults to true when auth_type is ManagedIdentity."
}

variable "create_cosmos_db_connection" {
  type        = bool
  default     = false
  description = "Whether to create a project connection and RBAC for the Cosmos DB account."
}

variable "create_ai_agent_service" {
  type        = bool
  default     = true
  description = "Whether to create the AI agent service"
}

variable "create_project_connections" {
  type        = bool
  default     = false
  description = "Whether to create project connections for AI Foundry, Cosmos DB, Key Vault, and AI Search. If set to false, the project will not create connections to these resources."
}

variable "sku" {
  type        = string
  default     = "S0"
  description = "SKU for the AI Foundry project"
}

variable "storage_account_id" {
  type        = string
  default     = null
  description = "Resource ID of the Storage Account"
}

variable "storage_account_location" {
  type        = string
  default     = null
  description = "Azure region of the Storage Account. Defaults to the project location."
}

variable "storage_account_auth_type" {
  type        = string
  default     = "ProjectManagedIdentity"
  description = "Authentication type for the Storage Account project connection."

  validation {
    condition     = contains(["AAD", "AccountKey", "ProjectManagedIdentity", "AccountManagedIdentity", "ManagedIdentity", "UserEntraToken", "AgentUserImpersonation", "AgenticIdentityToken", "AgenticUser"], var.storage_account_auth_type)
    error_message = "storage_account_auth_type must be one of: AAD, AccountKey, ProjectManagedIdentity, AccountManagedIdentity, ManagedIdentity, UserEntraToken, AgentUserImpersonation, AgenticIdentityToken, AgenticUser."
  }
}

variable "storage_account_use_project_identity" {
  type        = bool
  default     = null
  description = "Whether the Storage Account project connection uses the project/workspace managed identity. Defaults to true when auth_type is a project managed identity mode."
}

variable "create_storage_account_connection" {
  type        = bool
  default     = false
  description = "Whether to create a project connection and RBAC for the Storage Account."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Tags to apply to resources"
}
