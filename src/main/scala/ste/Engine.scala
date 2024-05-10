package ste

sealed trait EngineOption
case object BDD extends EngineOption
case object SMT extends EngineOption
