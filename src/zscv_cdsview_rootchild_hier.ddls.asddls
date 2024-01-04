define hierarchy ZSCV_CdsView_RootChild_Hier
  with parameters
    p_AbapViewName :vibastab
    
  as parent child hierarchy(
  
    source ZSCV_CdsView_RootChild_Recur
    
    child to parent association _Child
    
    start where
      ZSCV_CdsView_RootChild_Recur.ParentAbapViewName = $parameters.p_AbapViewName
      
    siblings order by
      ParentAbapViewName
      
    //Maximum depth is set to 20, because some DB tables like AUSP have a too deep hierarchy
    depth 20
    
    //1 view kan meerdere bovenliggende views hebben
    multiple parents allowed 
    
    cycles breakup
  )
  
{
  ParentAbapViewName        as AbapViewName,
  ChildAbapViewName         as ChildAbapViewName,

  $node.hierarchy_level     as HierarchyLevel,
  $node.hierarchy_is_orphan as IsOrphan,
  $node.hierarchy_tree_size as TreeSize,
  $node.hierarchy_is_cycle  as IsCycle,
  $node.node_id             as NodeId,

  _Child
}
